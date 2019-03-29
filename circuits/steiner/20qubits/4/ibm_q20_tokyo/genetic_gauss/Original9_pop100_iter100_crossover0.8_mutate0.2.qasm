// Initial wiring: [13, 11, 8, 15, 18, 6, 19, 12, 14, 5, 0, 9, 2, 10, 7, 17, 1, 3, 16, 4]
// Resulting wiring: [13, 11, 8, 15, 18, 6, 19, 12, 14, 5, 0, 9, 2, 10, 7, 17, 1, 3, 16, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[3];
cx q[13], q[2];
cx q[14], q[2];
cx q[18], q[6];
