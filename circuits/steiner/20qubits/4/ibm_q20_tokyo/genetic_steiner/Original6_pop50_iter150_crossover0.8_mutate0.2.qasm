// Initial wiring: [10, 9, 15, 1, 14, 2, 6, 11, 17, 0, 16, 4, 5, 13, 19, 12, 8, 3, 18, 7]
// Resulting wiring: [10, 9, 15, 1, 14, 2, 6, 11, 17, 0, 16, 4, 5, 13, 19, 12, 8, 3, 18, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[18], q[19];
cx q[6], q[12];
cx q[6], q[7];
