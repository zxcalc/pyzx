// Initial wiring: [0 3 2 7 1 5 6 4 8]
// Resulting wiring: [0 3 2 7 1 5 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[8], q[3];
cx q[4], q[3];
cx q[4], q[1];
cx q[6], q[7];
