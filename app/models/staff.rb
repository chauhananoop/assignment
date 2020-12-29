class Staff < ApplicationRecord
	paginates_per 4
	mount_uploader :profile, ProfileUploader
end
