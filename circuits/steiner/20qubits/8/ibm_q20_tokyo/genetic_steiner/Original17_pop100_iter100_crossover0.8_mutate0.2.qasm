// Initial wiring: [0, 2, 19, 17, 5, 11, 9, 16, 12, 7, 15, 13, 6, 8, 18, 3, 1, 10, 14, 4]
// Resulting wiring: [0, 2, 19, 17, 5, 11, 9, 16, 12, 7, 15, 13, 6, 8, 18, 3, 1, 10, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[13], q[12];
cx q[16], q[14];
cx q[12], q[18];
cx q[9], q[11];
cx q[6], q[7];
