#!/usr/bin/python3
from enum import Enum
from typing import List
import sys


class TokenType(Enum):
    UNKNOWN = 0
    NUMBER = 1
    PLUS = 2
    MINUS = 3
    MULTIPLY = 4
    DIVIDE = 5
    LPAREN = 6
    RPAREN = 7
    UNARYPLUS = 8
    UNARYMINUS = 9


class Token:
    def __init__(self, type: TokenType, val: float = 0) -> None:
        self.type: TokenType = type
        self.val: float = val


class TokenStream:
    def __init__(self, tokenList: List[Token]) -> None:
        self.list = tokenList
        self.index = 0
        self.len = len(tokenList)
    
    def is_empty(self) -> bool:
        return self.index >= self.len
    
    def read(self) -> Token:
        if self.is_empty():
            return Token(TokenType.UNKNOWN)
        ret = self.list[self.index]
        self.index += 1
        return ret
    
    def peek(self) -> Token:
        if self.is_empty():
            return Token(TokenType.UNKNOWN)
        return self.list[self.index]
    
    def peek_type(self) -> TokenType:
        if self.is_empty():
            return TokenType.UNKNOWN
        return self.list[self.index].type


class Node:
    def __init__(self, type: TokenType) -> None:
        self.type: TokenType = type


class NumNode(Node):
    def __init__(self, val: float) -> None:
        super().__init__(TokenType.NUMBER)
        self.val: float = val


class UnaryNode(Node):
    def __init__(self, type: TokenType, child: Node) -> None:
        super().__init__(type)
        self.child: Node = child


class BinaryNode(Node):
    def __init__(self, type: TokenType, left: Node, right: Node) -> None:
        super().__init__(type)
        self.left: Node = left
        self.right: Node = right


def expect(tokenList: TokenStream, type: TokenType) -> Token:
    if tokenList.peek_type() == type:
            return tokenList.read()
    else:
        raise Exception("Unable to parse expression")


def tokenize(string: str) -> TokenStream:
    temp = ""
    fStack: List[Token] = []
    op = ['+', '-', '*', '/', '(', ')']
    for ch in string:
        if ch.isspace():
            if temp:
                fStack.append(Token(TokenType.NUMBER, float(temp)))
                temp = ""
            continue
        if ch in op and temp:
            fStack.append(Token(TokenType.NUMBER, float(temp)))
            temp = ""
        if ch == '+':
            fStack.append(Token(TokenType.PLUS))
        elif ch == "-":
            fStack.append(Token(TokenType.MINUS))
        elif ch == '*':
            fStack.append(Token(TokenType.MULTIPLY))
        elif ch == '/':
            fStack.append(Token(TokenType.DIVIDE))
        elif ch == '(':
            fStack.append(Token(TokenType.LPAREN))
        elif ch == ")":
            fStack.append(Token(TokenType.RPAREN))
        else:
            temp += ch
    if temp:
        fStack.append(Token(TokenType.NUMBER, float(temp)))
    return TokenStream(fStack)


def parseExpr(tokenList: TokenStream) -> Node:
    left = parseTerm(tokenList)
    op = { TokenType.PLUS, TokenType.MINUS}
    while tokenList.peek_type() in op:
        token = tokenList.read()
        right = parseTerm(tokenList)
        left = BinaryNode(token.type, left, right)
    return left
            

def parseTerm(tokenList: TokenStream) -> Node:
    left = parseFactor(tokenList)
    op = { TokenType.MULTIPLY, TokenType.DIVIDE}
    while tokenList.peek_type() in op:
        token = tokenList.read()
        right = parseFactor(tokenList)
        left = BinaryNode(token.type, left, right)
    return left


def parseFactor(tokenList: TokenStream) -> Node:
    token = tokenList.peek_type()
    if token == TokenType.PLUS:
        expect(tokenList, TokenType.PLUS)
        return UnaryNode(TokenType.UNARYPLUS, parseFactor(tokenList))
    elif token == TokenType.MINUS:
        expect(tokenList, TokenType.MINUS)
        return UnaryNode(TokenType.UNARYMINUS, parseFactor(tokenList))
    elif token == TokenType.NUMBER:
        num = expect(tokenList, TokenType.NUMBER)
        return NumNode(num.val)
    elif token == TokenType.LPAREN:
        expect(tokenList, TokenType.LPAREN)
        expr = parseExpr(tokenList)
        expect(tokenList, TokenType.RPAREN)
        return expr
    else:
        raise Exception("Unable to parse expression")


def evalAST(head) -> float:
    if head.type == TokenType.UNARYMINUS:
        return -evalAST(head.child)
    elif head.type == TokenType.UNARYPLUS:
        return evalAST(head.child)
    elif head.type == TokenType.PLUS:
        return evalAST(head.left) + evalAST(head.right)
    elif head.type == TokenType.MINUS:
        return evalAST(head.left) - evalAST(head.right)
    elif head.type == TokenType.MULTIPLY:
        return evalAST(head.left) * evalAST(head.right)
    elif head.type == TokenType.DIVIDE:
        return evalAST(head.left) / evalAST(head.right)
    elif head.type == TokenType.NUMBER:
        return head.val
    else:
        raise Exception("Unable to parse expression")


def main():
    temp = ""
    stack = []
    while True:
        ch = sys.stdin.read(1)
        if ch == '':
            break
        elif ch == 'f':
            if temp != "":
                stack.append(temp)
            temp = ch
        elif ch == '(':
            if temp == 'f':
                temp += ch
                stack.append(temp)
                temp = ""
            else:
                temp += ch
        elif ch == ')':
            if stack.count == 0:
                temp += ch
            elif stack[-1] == 'f(':
                stack.pop()
                tokens = tokenize(temp)
                ast = parseExpr(tokens)
                val = evalAST(ast)
                fixed = int(val * 65536) & 0xFFFFFFFF
                stack.append(f"0x{fixed:X}")
                temp = ""
            else:
                temp += ch
        else:
            temp += ch
    stack.append(temp)
    final = "".join(stack)
    sys.stdout.write(final)


if __name__=="__main__":
    main()
