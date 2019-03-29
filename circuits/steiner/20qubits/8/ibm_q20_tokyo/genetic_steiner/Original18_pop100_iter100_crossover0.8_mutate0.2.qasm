// Initial wiring: [19, 2, 3, 9, 0, 7, 10, 6, 11, 5, 1, 14, 15, 16, 18, 8, 12, 4, 17, 13]
// Resulting wiring: [19, 2, 3, 9, 0, 7, 10, 6, 11, 5, 1, 14, 15, 16, 18, 8, 12, 4, 17, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[8], q[7];
cx q[18], q[11];
cx q[18], q[19];
cx q[14], q[16];
cx q[14], q[15];
