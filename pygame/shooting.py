import pygame
import sys
from time import sleep

BLACK = (0, 0, 0)
padWidth = 480   # 게임화면의 가로 크기
padHeight = 640  # 게임화면의 세로 크기


def drawObject(obj,x,y):
    global gamePad
    gamePad.blit(obj,(x,y))
def initGame():
    global gamePad, clock
    pygame.init()
    
    gamePad = pygame.display.set_mode((padWidth, padHeight))
    pygame.display.set_caption('PyShooting')            # 게임 이름
    background = pygame.image.load('background.png')    # 배경 그림
    clock = pygame.time.Clock()

def runGame():
    global gamePad, clock, background
    
    onGame = False
    while not onGame:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:  # 게임 프로그램 종료
                pygame.quit()
                sys.exit()
        
        gamePad.fill(BLACK)  # 게임 화면 (검은색)
        pygame.display.update()  # 게임화면을 다시 그림
        clock.tick(60)  # 게임화면의 초당 프레임수를 60으로 설정
    
    drawObject(background,0,0)              # 배경 화면 그리기
    
    pygame.quit()  # pygame 종료

initGame()
runGame()
        

        
    
