package kr.ac.hansung.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@Setter
@ToString
public class Subject {
	private int year;
	private int semester;
	@Size(min=2, max=20, message="과목이름은 2글자에서 20글자 사이로 입력해주세요!")
	@NotEmpty(message="과목이름은 필수입력입니다!")
	private String subname;
	@Size(min=1, max=5, message="교과구분명은 줄인말로 2글자로 적어주세요!")
	private String subtype;
	@Size(min=2, max=20, message="교수님 성함은 2글자에서 20글자 사이로 입력해주세요!")
	private String professor;
	private int score;
}



