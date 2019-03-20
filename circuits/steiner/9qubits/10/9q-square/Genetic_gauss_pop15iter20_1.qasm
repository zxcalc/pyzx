// Initial wiring: [0 1 2 7 3 5 4 6 8]
// Resulting wiring: [1 0 3 7 2 4 5 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[6], q[5];
cx q[0], q[1];
cx q[0], q[1];
cx q[0], q[1];
cx q[2], q[1];
cx q[8], q[3];
cx q[3], q[2];
cx q[3], q[2];
cx q[7], q[8];
cx q[3], q[8];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[3], q[4];
