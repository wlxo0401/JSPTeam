package kr.ac.inhatc;

public class CommonQuiz {
	public int[] answerNo = new int[10];
	public String Question[] = new String[10];
	public String QText[][] = new String[10][4];

	public CommonQuiz() {
		//1번 문제
		Question[0] = "우리나라가 광복을 맞이한 연도는?";
		QText[0][0] = "1910년";
		QText[0][1] = "1945년";
		QText[0][2] = "1948년";
		QText[0][3] = "1950년";
		answerNo[0] = 2;
		
		
		//2번 문제
		Question[1] = "EPL리그에 속하지 않은 클럽은?";
		QText[1][0] = "QuizImage/liverpool.png";
		QText[1][1] = "QuizImage/mancity.jpg";
		QText[1][2] = "QuizImage/munchen.jpg";
		QText[1][3] = "QuizImage/tottenham.png";
		answerNo[1] = 3;
		
		Question[2] = "아시아 국가가 아닌 국가는?";
		QText[2][0] = "대한민국";
		QText[2][1] = "필리핀";
		QText[2][2] = "중국";
		QText[2][3] = "벨기에";
		answerNo[2] = 4;
	}
	
}
