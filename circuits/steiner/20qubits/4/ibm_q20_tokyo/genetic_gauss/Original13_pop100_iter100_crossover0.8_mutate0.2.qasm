// Initial wiring: [7, 5, 15, 6, 1, 0, 14, 3, 8, 10, 2, 4, 11, 9, 16, 17, 12, 18, 19, 13]
// Resulting wiring: [7, 5, 15, 6, 1, 0, 14, 3, 8, 10, 2, 4, 11, 9, 16, 17, 12, 18, 19, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[17], q[19];
cx q[6], q[7];
cx q[8], q[19];
