// Initial wiring: [14, 15, 8, 7, 3, 16, 4, 13, 10, 1, 5, 0, 18, 9, 17, 19, 6, 11, 2, 12]
// Resulting wiring: [14, 15, 8, 7, 3, 16, 4, 13, 10, 1, 5, 0, 18, 9, 17, 19, 6, 11, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[9], q[8];
cx q[8], q[7];
cx q[11], q[9];
cx q[12], q[11];
cx q[12], q[6];
cx q[18], q[11];
cx q[3], q[5];
