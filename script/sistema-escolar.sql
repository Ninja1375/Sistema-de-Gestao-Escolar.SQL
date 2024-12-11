-- Criação da tabela de Alunos
CREATE TABLE Alunos (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_matricula DATE NOT NULL
);

-- Criação da tabela de Professores
CREATE TABLE Professores (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    especialidade VARCHAR(100)
);

-- Criação da tabela de Disciplinas
CREATE TABLE Disciplinas (
    disciplina_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Criação da tabela de Turmas
CREATE TABLE Turmas (
    turma_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    professor_id INT,
    disciplina_id INT,
    ano_letivo VARCHAR(10),
    FOREIGN KEY (professor_id) REFERENCES Professores(professor_id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(disciplina_id)
);

-- Criação da tabela de Matrículas (associação entre Alunos e Turmas)
CREATE TABLE Matriculas (
    matricula_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    turma_id INT,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);

-- Criação da tabela de Notas
CREATE TABLE Notas (
    nota_id INT PRIMARY KEY AUTO_INCREMENT,
    matricula_id INT,
    nota DECIMAL(5, 2) NOT NULL,
    data_avaliacao DATE NOT NULL,
    FOREIGN KEY (matricula_id) REFERENCES Matriculas(matricula_id)
);

-- Criação da tabela de Presenças
CREATE TABLE Presencas (
    presenca_id INT PRIMARY KEY AUTO_INCREMENT,
    matricula_id INT,
    data_presenca DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Presente', 'Ausente', 'Justificado')),
    FOREIGN KEY (matricula_id) REFERENCES Matriculas(matricula_id)
);
