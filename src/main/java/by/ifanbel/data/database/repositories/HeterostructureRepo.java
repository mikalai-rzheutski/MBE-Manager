package by.ifanbel.data.database.repositories;


import by.ifanbel.data.database.entities.Heterostructure;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface HeterostructureRepo extends JpaRepository<Heterostructure, String> {

	public Heterostructure findByDate(Date date);

	public Heterostructure findOneBySampleNumber(String sampleNumber);

	@Query("SELECT h.date, h.sampleNumber, h.description FROM Heterostructure h ORDER BY h.date DESC, h.sampleNumber DESC")
	public List<Object[]> getTableOfHeterostructures();

	//public List<Heterostructure> getAllBy();

}
