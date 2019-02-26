// Initial wiring: [1 0 2 8 7 6 5 3 4]
// Resulting wiring: [0 5 2 8 7 6 1 3 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[5], q[0];
cx q[4], q[1];
cx q[0], q[1];
cx q[0], q[1];
cx q[0], q[1];
cx q[4], q[5];
cx q[4], q[1];
cx q[5], q[6];
cx q[3], q[2];
