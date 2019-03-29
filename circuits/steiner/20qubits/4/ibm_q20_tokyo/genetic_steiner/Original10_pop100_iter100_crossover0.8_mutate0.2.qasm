// Initial wiring: [15, 3, 9, 6, 1, 13, 4, 11, 16, 14, 0, 18, 5, 12, 8, 10, 19, 17, 7, 2]
// Resulting wiring: [15, 3, 9, 6, 1, 13, 4, 11, 16, 14, 0, 18, 5, 12, 8, 10, 19, 17, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[13];
cx q[5], q[14];
cx q[3], q[6];
cx q[6], q[12];
