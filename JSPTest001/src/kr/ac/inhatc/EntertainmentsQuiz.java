package kr.ac.inhatc;

public class EntertainmentsQuiz {
	public int[] answerNo = new int[10];
	public String Question[] = new String[10];
	public String QText[][] = new String[10][4];

	public EntertainmentsQuiz() {
		//1번 문제
		Question[0] = "연예인 커플이 아닌 커플은?";
		QText[0][0] = "신민아♥︎김우빈";
		QText[0][1] = "윤계상♥︎이하늬";
		QText[0][2] = "현아♥︎이던";
		QText[0][3] = "송중기♥송혜교";
		answerNo[0] = 4;
		
		
		//2번 문제
		Question[1] = "다음 보기 중 여자 아이돌 그룹이 아닌 그룹은?";
		QText[1][0] = "트와이스";
		QText[1][1] = "블랙핑크";
		QText[1][2] = "오마이걸";
		QText[1][3] = "빅뱅";
		answerNo[1] = 4;
		
		Question[2] = "그룹 여자친구의 멤버가 아닌 사람은? ";
		QText[2][0] = "은하";
		QText[2][1] = "수진";
		QText[2][2] = "신비";
		QText[2][3] = "엄지";
		answerNo[2] = 2;
	}
	
}
