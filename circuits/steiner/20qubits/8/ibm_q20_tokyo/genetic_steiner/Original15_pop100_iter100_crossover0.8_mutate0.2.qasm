// Initial wiring: [5, 9, 19, 4, 8, 18, 7, 17, 13, 15, 1, 3, 14, 6, 2, 0, 11, 16, 10, 12]
// Resulting wiring: [5, 9, 19, 4, 8, 18, 7, 17, 13, 15, 1, 3, 14, 6, 2, 0, 11, 16, 10, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[13];
cx q[14], q[5];
cx q[16], q[15];
cx q[17], q[11];
cx q[11], q[8];
cx q[9], q[11];
cx q[3], q[5];
cx q[1], q[2];
