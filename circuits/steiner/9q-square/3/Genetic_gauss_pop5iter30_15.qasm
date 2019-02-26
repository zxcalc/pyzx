// Initial wiring: [5 2 1 3 4 6 0 7 8]
// Resulting wiring: [5 1 2 3 4 6 0 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[0];
cx q[4], q[7];
