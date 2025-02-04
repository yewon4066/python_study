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
    global gamePad, clock, background, fighter, missile
    pygame.init()
    
    gamePad = pygame.display.set_mode((padWidth, padHeight))
    pygame.display.set_caption('PyShooting')            # 게임 이름
    background = pygame.image.load('background.png')    # 배경 그림
    fighter = pygame.image.load('fighter.png')          # 전투기 그림
    missile = pygame.image.load('missile.png')          # 미사일 그림
    clock = pygame.time.Clock()

def runGame():
    global gamePad, clock, background,fighter, missile
    
    # 무기 좌표 리스트
    missileXY=[]
    
    # 전투기 크기
    fighterSize = fighter.get_rect().size
    fighterWidth = fighterSize[0]
    fighterHeight = fighterSize[1]
    
    # 전투기 초기 위치 (x,y)
    x = padWidth * 0.45
    y = padHeight * 0.9
    fighterX = 0

    
    onGame = False
    while not onGame:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:  # 게임 프로그램 종료
                pygame.quit()
                sys.exit()
            
            #전투기 움직이기    
            if event.type in [pygame.KEYDOWN]:
                if event.key == pygame.K_LEFT:      #전투기 왼쪽으로 이동
                    fighterX -= 5
                    
                elif event.key == pygame.K_RIGHT:    #전투기 오른쪽으로 이동
                    fighterX += 5
                
                #미사일 발사    
                elif event.key == pygame.K_SPACE:     
                    missileX = x + fighterWidth/2
                    missileY = y - fighterHeight
                    missileXY.append([missileX,missileY])
                    
                if event.type in [pygame.KEYUP]:         # 방향키를 떼면 전투기 멈춤
                    if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
                        fighterX=0
            #전투기 움직이기 끝        
        
    
        pygame.display.update()  # 게임화면을 다시 그림
        clock.tick(60)  # 게임화면의 초당 프레임수를 60으로 설정
    
        drawObject(background,0,0)      #배경화면 그리기
        
        #전투기 위치 재조정
        x += fighterX
        if x <0:
            x=0
        elif x> padWidth - fighterWidth:
            x=padWidth - fighterWidth
        
        drawObject(fighter,x,y)  # 비행기를 게임 화면의 (x,y) 좌표에 그림
        
        # 미사일 발사 화면에 그리기
        if len(missileXY) !=0:
            for i,bxy in enumerate(missileXY):  #미사일 요소에 대해 반복
                bxy[1] -= 10 # 총알의 y좌표 -10 (위로 이동)    
                missileXY[i][1] = bxy[1]
                if bxy[1] <= 0:  # 미사일이 화면 밖을 벗어나면
                    try:
                        missileXY.remove(bxy)       # 미사일 제거
                    except:
                        pass
                    
        if len(missileXY) ! = 0 :
            for bx, by in missileXY:
                drawObject(missile,bx,by)
                
                
    pygame.display.update()
    
    pygame.quit()  # pygame 종료

initGame()
runGame()






