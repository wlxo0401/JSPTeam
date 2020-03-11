package kr.ac.inhatc;

public class GameQuiz {
	public int[] answerNo = new int[10];
	public String Question[] = new String[10];
	public String QText[][] = new String[10][4];

	public GameQuiz() {
		//1번 문제
		Question[0] = "2004년도에 출시하여 국내에서 장수를 누리고 있는 게임으로 머리가 큰 캐릭터들이 탈 것을 타고 레이싱을 하는 게임은?";
		QText[0][0] = "서든어택";
		QText[0][1] = "카트라이더";
		QText[0][2] = "메이플스토리";
		QText[0][3] = "리니지";
		answerNo[0] = 2;
		
		
		//2번 문제
		Question[1] = "슈팅 요소가 없는 게임을 고르시오.";
		QText[1][0] = "버블파이터";
		QText[1][1] = "배틀그라운드";
		QText[1][2] = "오버워치";
		QText[1][3] = "바둑";
		answerNo[1] = 4;
		
		Question[2] = "포트나이드, 배틀그라운드, Apex 레전드 세 게임이 공통적으로 가지고 있지 않은 게임 요소는?";
		QText[2][0] = "배틀로얄";
		QText[2][1] = "슈팅";
		QText[2][2] = "연애시뮬레이션";
		QText[2][3] = "캐릭터 스킨";
		answerNo[2] = 3;
	}
	
}
