import { sleep } from 'k6';
import file from 'k6/x/file';

const filepath = 'output.txt';

export default function () {
    file.writeString(filepath, 'Writing to file');
}