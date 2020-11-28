package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Subject;

	@Repository
public class SubjectDao {
		private JdbcTemplate jdbcTemplate;
		
		@Autowired
		public void setDataSource(	DataSource dataSource) {
			this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
		
		public int getRowCount() {
			String sqlStatement = "select count(*) from mysubject";
			return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
		}
		
		//query and return a single object
		public Subject getSubject(String subname) {
			String sqlStatement = "select * from mysubject where name=?";
			try {
				return jdbcTemplate.queryForObject(sqlStatement, new Object[] {subname}, new RowMapper<Subject>() {
					
					@Override
					public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
						Subject sub = new Subject();
						sub.setYear(rs.getInt("year"));
						sub.setSemester(rs.getInt("semester"));
						sub.setScore(rs.getInt("score"));
						sub.setSubname(rs.getString("subname"));
						sub.setSubtype(rs.getString("subtype"));
						sub.setProfessor(rs.getString("professor"));
						
						return sub;
					}
				});
			}catch (EmptyResultDataAccessException e) {

				return null;

			}
		}
		
		public int getYSscore(int year, int semester) {
			String sqlStatement = "select distinct sum(score) from mysubject where year=? && semester=?; ";
			return jdbcTemplate.queryForObject(sqlStatement, new Object[] {year, semester}, Integer.class);
		}
		
		public List<Subject> getYSsubjects(int year, int semester){
			String sqlStatement = "select * from mysubject where year=? && semester=?;";
			return jdbcTemplate.query(sqlStatement, new Object[] {year, semester}, new RowMapper<Subject>() {

				@Override
				public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
					Subject sub = new Subject();
					sub.setYear(rs.getInt("year"));
					sub.setSemester(rs.getInt("semester"));
					sub.setScore(rs.getInt("score"));
					sub.setSubname(rs.getString("subname"));
					sub.setSubtype(rs.getString("subtype"));
					sub.setProfessor(rs.getString("professor"));
				
					return sub;
				}
			});		
		}
		
		//query and return multiple objects
		//READ METHOD
		public List<Subject> getSubjects(){
			String sqlStatement = "select * from mysubject";
			return jdbcTemplate.query(sqlStatement, new RowMapper<Subject>() {
				
				@Override
				public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
					Subject sub = new Subject();
					sub.setYear(rs.getInt("year"));
					sub.setSemester(rs.getInt("semester"));
					sub.setScore(rs.getInt("score"));
					sub.setSubname(rs.getString("subname"));
					sub.setSubtype(rs.getString("subtype"));
					sub.setProfessor(rs.getString("professor"));
				
					return sub;
				}
			});
		}
		
		//CREATE METHOD
		public boolean insert(Subject sub) {
			int year = sub.getYear();
			int semester = sub.getSemester();
			int score = sub.getScore();
			String subname = sub.getSubname();
			String subtype = sub.getSubtype();
			String professor = sub.getProfessor();
			
			String sqlStatement = "insert into mysubject (year, semester, score, subname, subtype, professor) values(?,?,?,?,?,?)";
			
			return (jdbcTemplate.update(sqlStatement, new Object[] {year, semester, score, subname, subtype, professor})==1);
		}
		
		
		//UPDATE METHOD
		public boolean update(Subject sub) {
			String subname = sub.getSubname();
			
			int year = sub.getYear();
			int semester = sub.getSemester();
			int score = sub.getScore();
			String subtype = sub.getSubtype();
			String professor = sub.getProfessor();
			
			String sqlStatement = "update mysubject set year=?, semester=?, score=?, subtype=?, professor=? where subname=?";
			

			return (jdbcTemplate.update(sqlStatement, new Object[] {year, semester, score, subtype, professor})==1);
	
		}
		
		//DELETE METHOD
		public boolean delete(int subname) {
			String sqlStatement = "delete from mysubject where subname=?";
			return (jdbcTemplate.update(sqlStatement, new Object[] {subname})==1);
		}
	}


