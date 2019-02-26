// Initial wiring: [5 1 2 3 7 0 6 4 8]
// Resulting wiring: [1 0 2 3 7 5 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[4], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[1];
cx q[0], q[1];
cx q[0], q[1];
cx q[5], q[4];
cx q[5], q[6];
cx q[0], q[5];
