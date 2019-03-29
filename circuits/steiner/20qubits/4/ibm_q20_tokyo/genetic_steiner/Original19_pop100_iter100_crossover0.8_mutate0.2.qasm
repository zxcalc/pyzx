// Initial wiring: [13, 11, 3, 5, 8, 9, 16, 2, 6, 1, 10, 4, 19, 7, 12, 18, 15, 17, 0, 14]
// Resulting wiring: [13, 11, 3, 5, 8, 9, 16, 2, 6, 1, 10, 4, 19, 7, 12, 18, 15, 17, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[14], q[13];
cx q[11], q[12];
cx q[3], q[6];
