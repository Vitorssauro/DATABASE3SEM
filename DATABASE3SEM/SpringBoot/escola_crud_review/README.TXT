Etapas:

Administrador(entidade) Model - Tabela
	-
	- Cad-ADM (Verificação) - Aberta
	- login(adm)
	- interna do adm 
		- cadastro do Professor
		- Cadastro do Aluno


Professor (entidade) Model - Tabela
	1- Pre Cadastro(Adm)
	2- cadastro (professor)
	3- login (professor)
	4- interna do professor	
		- listar os alunos na disciplina


Professor (entidade) Model - Tabela
	2- cadastro (ADM) - interna
	3- login - (professor)
	4- interna do professor


Aluno (entidade) Model - Tabela
	1- Pre Cadastro(Adm)
	2- cadastro (professor)
	3- login (professor)
	4- interna do professor	
		- listar os alunos na disciplina (lança nota e falta)

Aluno (entidade) Model - Tabela
	2- cadastro (ADM) - interna
	3- login - (professor)
	4- interna do professor
		- ver informações sobre (notas e faltas)
