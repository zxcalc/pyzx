// Initial wiring: [16, 3, 5, 18, 13, 8, 15, 12, 14, 7, 2, 9, 1, 4, 10, 19, 11, 0, 17, 6]
// Resulting wiring: [16, 3, 5, 18, 13, 8, 15, 12, 14, 7, 2, 9, 1, 4, 10, 19, 11, 0, 17, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[12], q[7];
cx q[13], q[15];
cx q[11], q[18];
