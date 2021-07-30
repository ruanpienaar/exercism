export const COLOR_CODES = {
    "black": 0,
    "brown": 1,
    "red": 2,
    "orange": 3,
    "yellow": 4,
    "green": 5,
    "blue": 6,
    "violet": 7,
    "grey": 8,
    "white": 9,
}

export const colorCode = (c: string) => {
    // let keys: any[] = Object.keys(COLOR_CODES);
    // return keys.indexOf(c);
    return COLOR_CODES[c];
}

export const COLORS = Object.keys(COLOR_CODES);
