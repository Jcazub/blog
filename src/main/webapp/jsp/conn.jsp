<%@ page import="java.sql.*" %>
<%
    // Read RDS connection information from the environment
    String dbName = System.getProperty("RDS_DB_NAME");
    String userName = System.getProperty("RDS_USERNAME");
    String password = System.getProperty("RDS_PASSWORD");
    String hostname = System.getProperty("RDS_HOSTNAME");
    String port = System.getProperty("RDS_PORT");
    String jdbcUrl = "jdbc:mysql://" + hostname + ":"
            + port + "/" + dbName + "?user=" + userName + "&password=" + password;

    // Load the JDBC driver
    try {
        System.out.println("Loading driver...");
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver loaded!");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException("Cannot find the driver in the classpath!", e);
    }

    Connection conn = null;
    Statement setupStatement = null;
    Statement readStatement = null;
    ResultSet resultSet = null;
    String results = "";
    int numresults = 0;
    String statement = null;

    try {
        // Create connection to RDS DB instance
        conn = DriverManager.getConnection(jdbcUrl);

        // Create a table and write two rows
        setupStatement = conn.createStatement();
        String createTable = "CREATE TABLE Beanstalk (Resource char(50));";
        String insertRow1 = "INSERT INTO Beanstalk (Resource) VALUES ('EC2 Instance');";
        String insertRow2 = "INSERT INTO Beanstalk (Resource) VALUES ('RDS Instance');";

        setupStatement.addBatch(createTable);
        setupStatement.addBatch(insertRow1);
        setupStatement.addBatch(insertRow2);
        setupStatement.executeBatch();
        setupStatement.close();

    } catch (SQLException ex) {
        // Handle any errors
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());
    } finally {
        System.out.println("Closing the connection.");
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ignore) {
            }
        }
    }

    try {
        conn = DriverManager.getConnection(jdbcUrl);

        readStatement = conn.createStatement();
        resultSet = readStatement.executeQuery("SELECT Resource FROM Beanstalk;");

        resultSet.first();
        results = resultSet.getString("Resource");
        resultSet.next();
        results += ", " + resultSet.getString("Resource");

        resultSet.close();
        readStatement.close();
        conn.close();

    } catch (SQLException ex) {
        // Handle any errors
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());
    } finally {
        System.out.println("Closing the connection.");
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ignore) {
            }
        }
    }
%>

<!DOCTYPE html>
<html class="index-html" lang="en">

    <head>

        <title>Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap 3 core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" id="bootstrap-css">
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Main CSS -->  
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bp.css" rel="stylesheet">

    </head>

    <body>
        <p>Established connection to RDS. Read first two rows:</p>
    </body>
    
</html>

