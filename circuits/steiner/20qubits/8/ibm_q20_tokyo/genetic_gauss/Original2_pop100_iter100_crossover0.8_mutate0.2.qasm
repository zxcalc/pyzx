// Initial wiring: [9, 19, 14, 18, 13, 4, 5, 10, 0, 11, 1, 3, 15, 6, 12, 17, 7, 8, 2, 16]
// Resulting wiring: [9, 19, 14, 18, 13, 4, 5, 10, 0, 11, 1, 3, 15, 6, 12, 17, 7, 8, 2, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[0];
cx q[10], q[7];
cx q[16], q[17];
cx q[11], q[12];
cx q[6], q[11];
cx q[4], q[11];
cx q[3], q[4];
cx q[5], q[18];
