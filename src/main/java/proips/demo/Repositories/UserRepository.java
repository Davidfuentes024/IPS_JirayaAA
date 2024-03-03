package proips.demo.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import proips.demo.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
