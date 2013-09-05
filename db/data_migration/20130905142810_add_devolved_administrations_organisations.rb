
type = OrganisationType.where(name: 'Devolved administration', analytics_prefix: 'DA').first_or_create!

devolved_administrations = [
  ['Scottish Parliament', 'http://www.scottish.parliament.uk/'],
  ['National Assembly for Wales','http://www.assemblywales.org/'],
  ['Northern Ireland Assembly','http://www.niassembly.gov.uk/'],
]

devolved_administrations.each do |administration|
  name, url = administration
  Organisation.create!( name: name,
                        logo_formatted_name: name,
                        organisation_type: type,
                        url: url,
                        organisation_logo_type_id: OrganisationLogoType::NoIdentity.id,
                        govuk_status: 'exempt')
end
