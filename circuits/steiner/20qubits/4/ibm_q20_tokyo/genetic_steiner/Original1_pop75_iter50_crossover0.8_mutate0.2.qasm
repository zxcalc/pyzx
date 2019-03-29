// Initial wiring: [4, 6, 1, 2, 7, 18, 17, 12, 16, 9, 11, 10, 14, 0, 13, 15, 19, 8, 5, 3]
// Resulting wiring: [4, 6, 1, 2, 7, 18, 17, 12, 16, 9, 11, 10, 14, 0, 13, 15, 19, 8, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[17], q[12];
cx q[11], q[12];
cx q[3], q[6];
