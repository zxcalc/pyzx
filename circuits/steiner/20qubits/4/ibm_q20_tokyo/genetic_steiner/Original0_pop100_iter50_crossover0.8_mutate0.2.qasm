// Initial wiring: [2, 16, 8, 1, 11, 18, 13, 7, 4, 5, 12, 14, 9, 3, 19, 17, 10, 0, 6, 15]
// Resulting wiring: [2, 16, 8, 1, 11, 18, 13, 7, 4, 5, 12, 14, 9, 3, 19, 17, 10, 0, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[13];
cx q[17], q[18];
cx q[8], q[9];
cx q[6], q[7];
