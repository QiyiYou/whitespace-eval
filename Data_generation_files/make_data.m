function [] = make_data(label)

% accepted_values = 'capacity, ccdf_points, char, fcc_mask, fm_mask, jam, hex, mac_table, noise, pl_squares';
accepted_values = get_simulation_value('labels');
switch(label.label_type)
    case 'capacity',
        make_capacity(label);
    case 'ccdf_points',
        make_ccdf_points(label);
    case 'char',
        make_char(label);
    case 'fcc_mask',
        make_mask(label);
    case 'fm_mask',
        make_mask(label);
    case 'jam',
        make_jam(label);
    case 'hex',
        make_hex(label);
    case 'mac_table',
        make_mac_table(label);      
    case 'noise',
        make_noise(label);
    case 'pl_squares',
        make_pl_squares(label);
    case 'population',
        make_population(label);
    case 'region_areas',
        make_region_areas(label);
    case 'region_mask',
        make_region_mask(label);
    case 'region_outline',
        make_region_outline(label);
    case 'test',
        error('TEST labels do not have associated data.');
    case 'tv_signal',
        make_tv_signal(label);

    otherwise,
        error(['Unrecognized label type: ''' label.label_type '''. Acceptable values are: ' accepted_values]);
end



end