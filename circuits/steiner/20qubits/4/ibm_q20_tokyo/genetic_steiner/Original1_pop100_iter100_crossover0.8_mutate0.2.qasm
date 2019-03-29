// Initial wiring: [13, 8, 14, 5, 19, 9, 18, 3, 10, 15, 11, 1, 6, 12, 7, 16, 0, 17, 2, 4]
// Resulting wiring: [13, 8, 14, 5, 19, 9, 18, 3, 10, 15, 11, 1, 6, 12, 7, 16, 0, 17, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[13], q[12];
cx q[18], q[17];
cx q[1], q[2];
