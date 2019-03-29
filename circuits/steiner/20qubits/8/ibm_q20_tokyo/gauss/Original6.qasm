// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[3], q[1];
cx q[7], q[6];
cx q[18], q[14];
cx q[18], q[19];
cx q[13], q[15];
cx q[14], q[19];
cx q[7], q[17];
cx q[1], q[2];
cx q[1], q[6];
