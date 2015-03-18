workingfolder = './';
binfilename = 'Exercice6';

%create the input data file
fid = fopen( [ workingfolder, input_file], 'wt' ); %create or overwrite (empty file, text mode)

%fill the file
fprintf( fid, num2str(trivial) );
fprintf( fid, '\n');
fprintf( fid, num2str(N1) );
fprintf( fid, '\n');
fprintf( fid, num2str(N2) );
fprintf( fid, '\n');
fprintf( fid, output_file );
fprintf( fid, '\n');

fclose( fid );


eval( [ '!', workingfolder, binfilename, ' < ', input_file] );

fprintf('\n');