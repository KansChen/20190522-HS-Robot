
' (ADD YOUR COMMON/COMMON SHARED VARIABLE HERE )

PROGRAM
' (ADD YOUR DIM VARIABLE HERE )

WITH ROBOT
ATTACH ROBOT
ATTACH EXT_AXES

' (WRITE YOUR CODE HERE)

IR[16]=1
MOVE JR[1]
CALL SETTOOLNUM(1)
WHILE IR[16]<8

MOVE ROBOT JR[8]     '码垛原料台取料过渡点

MOVE ROBOT  LR[107]     '码垛原料台取料点上方
MOVES ROBOT  LR[106] VTRAN=100     '码垛原料台取料点
DELAY ROBOT 100
D_OUT[29] = ON     '夹具夹紧

DELAY ROBOT 500
MOVES ROBOT  LR[107] VTRAN=100     '码垛原料台取料点上方
MOVE ROBOT  JR[9]     '码垛原料台放料过渡点

IF IR[16]=1 THEN     '码垛台放料点1-1
MOVE ROBOT  LR[100]+LR[2]     '码垛台放料点1-1上方
MOVES ROBOT  LR[100] VTRAN=100     '码垛台放料点1-1
DELAY ROBOT 100
D_OUT[29] = OFF     '夹具松开
CALL CHECK1(28)
DELAY ROBOT 500
MOVES ROBOT  LR[100]+LR[2]     '码垛台放料点1-1上方
END IF

'------------------------第一层-----------------------------------------------------

IF IR[16]=2 THEN     '码垛台放料点1-2
MOVE ROBOT  LR[101]+LR[2]     '码垛台放料点1-2上方
MOVES ROBOT  LR[101] VTRAN=100     '码垛台放料点1-2
DELAY ROBOT 100
D_OUT[29] = OFF     '夹具松开

DELAY ROBOT 500
MOVES ROBOT  LR[101]+LR[2]     '码���台放料点1-1上方
END IF

IF IR[16]=3 THEN     '码垛台放料点1-3
MOVE ROBOT  LR[102]+LR[2]     '码垛台放料点1-3上方
MOVES ROBOT  LR[102] VTRAN=100     '码垛台放料点1-3
DELAY ROBOT 100
D_OUT[29] = OFF     '夹具松开

DELAY ROBOT 500
MOVES ROBOT  LR[102]+LR[2]     '码垛台放料点1-3上方
END IF

IF IR[16]=4 THEN     '码垛台放料点1-4
MOVE ROBOT  LR[103]+LR[2]     '码垛台放料点1-4上方
MOVES ROBOT  LR[103] VTRAN=100     '码垛台放料点1-4
DELAY ROBOT 100
D_OUT[29] = OFF     '夹具松开

DELAY ROBOT 500
MOVES ROBOT  LR[103]+LR[2]     '码垛台放料点1-4上方
END IF

'------------------------第二层-----------------------------------------------------
IF IR[16]=5 THEN     '码垛台放料点2-1
MOVE ROBOT  LR[100]+LR[2]+LR[4]     '码垛台放料点2-1上方  LR[4]作为料的高度
MOVES ROBOT  LR[100]+LR[4] VTRAN=100     '码垛台放料点2-1
DELAY ROBOT 100
D_OUT[29] = OFF     '夹具松开
DELAY ROBOT 500

MOVES ROBOT  LR[100]+LR[2]+LR[4]     '码垛台放料点2-1上方
END IF

IF IR[16]=6 THEN     '码垛台放料点2-2
MOVE ROBOT  LR[101]+LR[2]+LR[4]     '码垛台放料点2-2上方  LR[4]作为料的高度
MOVES ROBOT  LR[101]+LR[4] VTRAN=100     '码垛台放料点2-2
DELAY ROBOT 100
D_OUT[29] = OFF     '夹具松开

DELAY ROBOT 500
MOVES ROBOT  LR[101]+LR[2]+LR[4]     '码垛台放料点2-2上方
END IF

IF IR[16]=7 THEN     '码垛台放料点2-3
MOVE ROBOT  LR[102]+LR[2]+LR[4]     '码垛台放料点2-3上方  LR[4]作为料的高度
MOVES ROBOT  LR[102]+LR[4] VTRAN=100     '码垛台放料点2-2
DELAY ROBOT 100
D_OUT[29] = OFF     '夹具松开

DELAY ROBOT 500
MOVES ROBOT  LR[102]+LR[2]+LR[4]     '码垛台放料点2-3上方
END IF

IF IR[16]=8 THEN     '码垛台放料点2-4
MOVE ROBOT  LR[103]+LR[2]+LR[4]     '码垛台放料点2-4上方  LR[4]作为料的高度
MOVES ROBOT  LR[103]+LR[4] VTRAN=100     '码垛台放料点2-4
DELAY ROBOT 100
D_OUT[29] = OFF     '夹具松开

DELAY ROBOT 500
MOVES ROBOT  LR[103]+LR[2]+LR[4]     '码垛台放料点2-4上方
END IF


IR[16]=IR[16]+1     '码垛物料自动���1标记
SLEEP 100
END WHILE

MOVE ROBOT  JR[8]     '码垛原料台取料过渡点
IR[16]=1     '码垛物料标记复位
MOVE JR[1]




SLEEP 100

DETACH ROBOT
DETACH EXT_AXES
END WITH
END PROGRAM

