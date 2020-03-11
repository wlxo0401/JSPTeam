package kr.ac.inhatc;

public class CommonQuiz {
	public int[] answerNo = new int[10];
	public String Question[] = new String[10];
	public String QText[][] = new String[10][4];

	public CommonQuiz() {
		//1번 문제
		Question[0] = "1번문제";
		QText[0][0] = "1";
		QText[0][1] = "2";
		QText[0][2] = "3";
		QText[0][3] = "4";
		answerNo[0] = 2;
		
		
		//2번 문제
		Question[1] = "2번문제";
		QText[1][0] = "1";
		QText[2][1] = "2";
		QText[3][2] = "3";
		QText[4][3] = "4";
		answerNo[1] = 3;
	}
	
}
