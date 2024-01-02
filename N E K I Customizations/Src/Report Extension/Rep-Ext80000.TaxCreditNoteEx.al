reportextension 80000 TaxCreditNoteext extends "Standard Sales - Credit Memo"
{
    dataset
    {

        add(Header)
        {
            column(fax; CompanyInfo."Fax No.")
            {

            }

            column(CompPicture; CompanyInfo.Picture)
            {

            }
        }
        // Add changes to dataitems and columns here
    }

    requestpage
    {
        // Add changes to the requestpage here
    }


    rendering
    {
        layout(TaxCreditNote)
        {
            Type = RDLC;
            LayoutFile = './Src/Layout/TaxCreditNoteNew.rdlc';
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;

}