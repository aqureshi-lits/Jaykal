report 80033 "LIT Employee Pay Slip - IAX"
{

    DefaultLayout = RDLC;
    RDLCLayout = './Src/Layout/Employee Pay Slip - IAX.rdlc';
    EnableHyperlinks = true;
    Caption = 'Employee Pay Slip - IAX';
    PreviewMode = PrintLayout;

    dataset
    {

        dataitem(DataItem1; Employee)
        {
            RequestFilterFields = "No.";
            column(Picture_CompanyInformation; CompanyInformation.Picture)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(ComName; CompanyInformation.Name)
            {
            }
            column(Address; CompanyInformation.Address)
            {
            }
            column(Addrss2; CompanyInformation."Address 2")
            {
            }
            column(City; CompanyInformation.City)
            {
            }
            column(CompanyTRN; CompanyInformation."VAT Registration No.")
            {
            }
            column(CityandCountry; 'P.O. BOX. No. : ' + CompanyInformation."Post Code" + ', ' + CompanyInformation.City + ' - ' + CompanyInformation."Country/Region Code")
            {
            }
            column(CompPhone; 'Tel No. : ' + CompanyInformation."Phone No.")
            {
            }
            column(CompFax; 'Fax No. : ' + CompanyInformation."Fax No.")
            {
            }
            column(Comp_Post; 'P.O. BOX. No. : ' + CompanyInformation."Post Code")
            {
            }
            column(CompEmail; 'Email : ' + CompanyInformation."E-Mail")
            {
            }
            column(Single_TRN; 'TRN # : ' + CompanyInformation."VAT Registration No.")
            {
            }
            column(No_Employee; "No.")
            {
            }
            column(FirstName_Employee; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(MiddleName_Employee; "Middle Name")
            {
            }
            column(LastName_Employee; "Last Name")
            {
            }
            column(Gender_Employee; Gender)
            {
            }
            column(EmploymentDate_Employee; "Employment Date")
            {
            }
            column(PhoneNo_Employee; "Phone No.")
            {
            }
            column(MobilePhoneNo_Employee; "Mobile Phone No.")
            {
            }
            column(EMail_Employee; "E-Mail")
            {
            }
            column(JobTitle_Employee; "Job Title")
            {
            }
            column(BankBranchNo_Employee; "Bank Branch No.")
            {
            }
            column(BankAccountNo_Employee; "Bank Account No.")
            {
            }
            column(IBAN_Employee; IBAN)
            {
            }
            column(SWIFTCode_Employee; "SWIFT Code")
            {
            }
            column(DateFilter_Employee; "Date Filter")
            {
            }
            dataitem(DataItem2; "Employee Ledger Entry")
            {
                DataItemLink = "Employee No." = FIELD("No."),
                               "Posting Date" = FIELD("Date Filter");
                RequestFilterFields = "Employee No.", "Posting Date";
                column(EmployeeNo_EmployeeLedgerEntry; "Employee No.")
                {
                }
                column(Description_EmployeeLedgerEntry; Description)
                {
                }
                column(DocumentNo_EmployeeLedgerEntry; "Document No.")
                {
                }
                column(PostingDate_EmployeeLedgerEntry; "Posting Date")
                {
                }
                column(PaymentMethodCode_EmployeeLedgerEntry; "Payment Method Code")
                {
                }

                column(DateFilter_EmployeeLedgerEntry; "Date Filter")
                {
                }
                column(DebitAmount_EmployeeLedgerEntry; "Debit Amount")
                {
                }
                column(CreditAmount_EmployeeLedgerEntry; "Credit Amount")
                {
                }
                column(Amount_EmployeeLedgerEntry; Amount)
                {
                }
                column(ReasonCode_EmployeeLedgerEntry; "Reason Code")
                {
                }
                column(GlobalDimension1Code_EmployeeLedgerEntry; "Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_EmployeeLedgerEntry; "Global Dimension 2 Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //CurrReport.NEWPAGEPERRECORD := TRUE;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //CurrReport.NEWPAGEPERRECORD := TRUE;
            end;
            /*
                        trigger OnPostDataItem()
                        begin
                            IF (SendEmailPaySlip = TRUE) THEN
                              IF CONFIRM('Do you want to send email salary slip to employee %1', FALSE , Employee."First Name") THEN BEGIN
                                SendEmailCU.SendSalarySlipAlert(Employee,Period);
                                MESSAGE('Salary slip haas been sent to employee "%1"',Employee."First Name");
                                END ELSE
                                EXIT
                        end;
                        */

        }
    }

    trigger OnPreReport()
    begin
        IF CompanyInformation.GET() THEN
            CompanyInformation.CALCFIELDS(Picture);

        //                Period := Employee.GETFILTER("Date Filter");

        //   IF Period = '' THEN
        //      ERROR('Please enter the date filter for the salary period.');

        /*
        IF EmployeeNo = '' THEN BEGIN
         ERROR('Please select the Employee No.');
          END;
        
        IF Period = 0D THEN BEGIN
          ERROR('Please enter the posting date for the salary period.');
        END;
        */

    end;


    var
        CompanyInformation: Record 79;
    //SendEmailCU: Codeunit "50001";
}

