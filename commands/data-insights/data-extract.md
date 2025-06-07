UNDERSTAND data requirements:
  - Purpose of data extraction
  - Required data fields and tables
  - Time range and filters needed
  - Output format requirements
  - Privacy and compliance constraints
  - Intended data usage
VERIFY permissions and compliance:
  - Check data access authorization
  - Review data classification levels
  - Confirm GDPR/CCPA compliance needs
  - Verify retention policy compliance
  - Document access justification
  - Get necessary approvals
IDENTIFY data sources:
  - Production database connections
  - Read replicas for performance
  - Data warehouse or analytics DB
  - API endpoints for data access
  - Log files or data lakes
  - Third-party data sources
IMPLEMENT data anonymization:
  - Remove PII (names, emails, phones)
  - Hash or tokenize user IDs
  - Generalize location data
  - Aggregate sensitive metrics
  - Remove internal identifiers
  - Mask financial information
CREATE extraction query:
  - Optimize for performance
  - Use appropriate indexes
  - Implement pagination for large sets
  - Add progress monitoring
  - Include data quality checks
  - Handle null values appropriately
VALIDATE extracted data:
  - Check row counts match expectations
  - Verify data types and formats
  - Validate date ranges
  - Check for data anomalies
  - Ensure anonymization completeness
  - Test referential integrity
TRANSFORM for analysis:
  - Clean and normalize data
  - Handle missing values
  - Convert data types as needed
  - Create derived fields
  - Apply business logic
  - Format for target system
SECURE data handling:
  - Encrypt data at rest
  - Use secure transfer methods
  - Implement access controls
  - Set expiration dates
  - Log all access
  - Plan secure deletion
DOCUMENT the extraction:
  - Data dictionary
  - Extraction methodology
  - Anonymization techniques used
  - Known limitations
  - Refresh instructions
  - Contact information