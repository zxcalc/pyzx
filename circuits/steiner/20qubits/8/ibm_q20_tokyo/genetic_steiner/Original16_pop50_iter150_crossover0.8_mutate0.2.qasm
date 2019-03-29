// Initial wiring: [13, 6, 1, 14, 10, 19, 3, 11, 12, 8, 2, 18, 17, 15, 0, 9, 7, 4, 5, 16]
// Resulting wiring: [13, 6, 1, 14, 10, 19, 3, 11, 12, 8, 2, 18, 17, 15, 0, 9, 7, 4, 5, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[6], q[3];
cx q[11], q[9];
cx q[14], q[5];
cx q[18], q[17];
cx q[18], q[11];
cx q[13], q[15];
cx q[7], q[8];
