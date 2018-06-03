function AddSubModulePaths()
% AddSubModulePaths is called by SecondaryRiskCalculator during 
% initialization to add all submodule paths and verify the submodule 
% functions are present.
%
% Author: Mark Geurts, mark.w.geurts@gmail.com
% Copyright (C) 2018 University of Wisconsin Board of Regents
%
% This program is free software: you can redistribute it and/or modify it 
% under the terms of the GNU General Public License as published by the  
% Free Software Foundation, either version 3 of the License, or (at your 
% option) any later version.
%
% This program is distributed in the hope that it will be useful, but 
% WITHOUT ANY WARRANTY; without even the implied warranty of 
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General 
% Public License for more details.
% 
% You should have received a copy of the GNU General Public License along 
% with this program. If not, see http://www.gnu.org/licenses/.

% Check if MATLAB can find dicominfo (Image Processing Toolbox)
if exist('dicominfo', 'file') ~= 2
    
    % If not, throw an error
    if exist('Event', 'file') == 2
        Event(['The Image Processing Toolbox cannot be found and is ', ...
            'required by this application.'], 'ERROR');
    else
        error(['The Image Processing Toolbox cannot be found and is ', ...
            'required by this application.']);
    end
end

% Add dicom_tools submodule to search path
addpath('./dicom_tools');

% Check if MATLAB can find ParseSNCprm
if exist('LoadDICOMDose', 'file') ~= 2
    
    % If not, throw an error
    Event(['The dicom_tools submodule does not exist in the search path. Use ', ...
        'git clone --recursive or git submodule init followed by git ', ...
        'submodule update to fetch all submodules'], 'ERROR');
end

% Add dicom_tools submodule to search path
addpath('./tcs_plots');

% Check if MATLAB can find ImageViewer
if exist('ImageViewer', 'file') ~= 2
    
    % If not, throw an error
    Event(['The tcs_plots submodule does not exist in the search path. Use ', ...
        'git clone --recursive or git submodule init followed by git ', ...
        'submodule update to fetch all submodules'], 'ERROR');
end
