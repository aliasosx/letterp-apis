const mv = require('mv');

module.exports = {
    async upload(image, type) {
        let name = image.name.split(".");
        const extension = name[name.length - 1];
        const new_path = "public/uploads/" + type + "/" + image.name;
        return mv(image.path, new_path, {
            mkdirp: true
        }, (err, result) => {
            if (err) {
                throw err
            } else {
                return result;
            }
        });
    }
}