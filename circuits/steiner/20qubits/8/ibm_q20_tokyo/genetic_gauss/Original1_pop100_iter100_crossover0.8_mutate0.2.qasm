// Initial wiring: [5, 7, 17, 3, 1, 13, 4, 16, 19, 2, 15, 6, 18, 9, 10, 14, 12, 0, 8, 11]
// Resulting wiring: [5, 7, 17, 3, 1, 13, 4, 16, 19, 2, 15, 6, 18, 9, 10, 14, 12, 0, 8, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[6];
cx q[16], q[15];
cx q[16], q[13];
cx q[16], q[11];
cx q[18], q[0];
cx q[18], q[13];
cx q[5], q[6];
cx q[3], q[6];
