// Initial wiring: [10, 18, 2, 3, 7, 16, 13, 12, 5, 19, 14, 4, 15, 8, 0, 1, 9, 6, 17, 11]
// Resulting wiring: [10, 18, 2, 3, 7, 16, 13, 12, 5, 19, 14, 4, 15, 8, 0, 1, 9, 6, 17, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[7];
cx q[17], q[11];
cx q[11], q[8];
cx q[6], q[13];
