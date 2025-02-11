##############################################################################
## Universitatea Al.I.Cuza Iași / Al.I.Cuza University of Iasi (Romania)
## Facultatea de Economie si Administrarea Afacerilor / Faculty of
##          Economics and Business Administration
## Colectivul de Informatică Economică / Dept. of Business Information Systems
##############################################################################

##############################################################################
##        Studiu de caz: Interogări tidyverse pentru baza de date `chinook`
##        Case study: tidyverse queries for `chinook` database
##############################################################################
## 					tidyverse13: Pivotare
## 					tidyverse13: Pivoting
##############################################################################
## ultima actualizare / last update: 2022-03-17


##############################################################################
##              Afișați, pentru fiecare client, pe coloane separate,
##                    vânzările pe anii 2010, 2011 și 2012 (6)
##############################################################################
##            Display, for each customer, on three different columns,
##                    the total sales on 2010, 2011 și 2012  (6)
##############################################################################


temp <- customer %>%
     transmute (customer_name = paste(lastname, firstname),
                city, state, country, customerid) %>%
     inner_join(
          invoice %>%
               filter (year(invoicedate) %in% c(2010, 2011, 2012)) %>%
               group_by(customerid, year = year(invoicedate)) %>%
               summarise(sales = sum(total)) %>%
               ungroup()
     ) %>%
     select(-customerid) %>%
     arrange(customer_name, year) %>%
     pivot_wider(names_from = year, values_from = sales)



##############################################################################
##               Probleme de rezolvat la curs/laborator/acasa
##############################################################################
##               To be completed during lectures/labs or at home
##############################################################################

##############################################################################
##              Afișați, pentru fiecare client, pe coloane separate,
##                    vânzările pentru fircare an (2009-2013)
##############################################################################
##            Display, for each customer, on three different columns,
##                    the total sales on each year (2009-2013)
##############################################################################




##...


##############################################################################
##             La ce întrebări răspund următoarele interogări ?
##############################################################################
##          For what requirements the following queries provide the result?
##############################################################################
