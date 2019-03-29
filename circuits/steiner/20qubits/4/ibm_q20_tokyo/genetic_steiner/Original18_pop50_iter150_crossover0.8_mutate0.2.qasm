// Initial wiring: [10, 17, 13, 18, 15, 0, 3, 16, 5, 2, 7, 8, 1, 4, 12, 9, 19, 6, 11, 14]
// Resulting wiring: [10, 17, 13, 18, 15, 0, 3, 16, 5, 2, 7, 8, 1, 4, 12, 9, 19, 6, 11, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[10], q[9];
cx q[11], q[18];
cx q[6], q[13];
