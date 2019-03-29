// Initial wiring: [12, 1, 13, 6, 11, 15, 19, 9, 0, 18, 3, 16, 2, 10, 17, 7, 8, 5, 14, 4]
// Resulting wiring: [12, 1, 13, 6, 11, 15, 19, 9, 0, 18, 3, 16, 2, 10, 17, 7, 8, 5, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[8], q[1];
cx q[14], q[13];
cx q[9], q[11];
cx q[9], q[10];
cx q[10], q[19];
cx q[11], q[18];
cx q[3], q[4];
