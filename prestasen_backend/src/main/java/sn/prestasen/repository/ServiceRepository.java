package sn.prestasen.repository;

import sn.prestasen.entity.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.UUID;

public interface ServiceRepository extends JpaRepository<Service, UUID>, JpaSpecificationExecutor<Service> {

    List<Service> findByProfessionnelIdAndActifTrueOrderByDateCreationAsc(UUID professionnelId);
}