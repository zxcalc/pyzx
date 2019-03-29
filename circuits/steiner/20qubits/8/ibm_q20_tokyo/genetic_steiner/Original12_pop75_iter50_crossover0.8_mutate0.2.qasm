// Initial wiring: [10, 15, 4, 7, 14, 12, 5, 19, 8, 18, 16, 3, 17, 2, 0, 6, 9, 11, 1, 13]
// Resulting wiring: [10, 15, 4, 7, 14, 12, 5, 19, 8, 18, 16, 3, 17, 2, 0, 6, 9, 11, 1, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[18], q[11];
cx q[14], q[15];
cx q[12], q[18];
cx q[12], q[13];
cx q[9], q[10];
cx q[8], q[11];
cx q[3], q[4];
