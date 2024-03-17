    def execute_query(self, query: str, params=None) -> mysql.connector.connection.MySQLCursor:
        cursor = self.connection.cursor()
        try:
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
            return cursor
        except mysql.connector.Error as e:
            self.connection.rollback()
            raise ConnectionError(f"Error executing query: {e}") from e